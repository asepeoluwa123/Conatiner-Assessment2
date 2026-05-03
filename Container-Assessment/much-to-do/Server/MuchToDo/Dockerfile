# ---------- STAGE 1: Build ----------
FROM golang:1.26-alpine AS builder

# Install git (needed for private modules sometimes)
RUN apk add --no-cache git

# Set working directory
WORKDIR /app

# Copy go mod files first (for caching)
COPY go.mod go.sum ./

# Download dependencies (cached layer)
RUN go mod download

# Copy the rest of the source code
COPY . .

# Build the binary
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app ./cmd/api

# ---------- STAGE 2: Run ----------
FROM alpine:3.19

# Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Set working directory
WORKDIR /app

# Copy only the built binary from builder
COPY --from=builder /app/app .

# Copy .env.docker and rename to .env for runtime
COPY .env.docker .env

# Change ownership
RUN chown -R appuser:appgroup /app

# Switch to non-root user
USER appuser

# Expose app port (adjust if needed)
EXPOSE 8080

# Healthcheck (simple HTTP check)
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8080/health || exit 1

# Run the app
CMD ["./app"]
