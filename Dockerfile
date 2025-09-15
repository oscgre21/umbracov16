# Build stage
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copy project file
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o /app/publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app

# Install required dependencies for Umbraco
RUN apt-get update && apt-get install -y \
    libgdiplus \
    libc6-dev \
    && rm -rf /var/lib/apt/lists/*

COPY --from=build /app/publish .

# Create media and logs directories
RUN mkdir -p /app/umbraco/Data /app/umbraco/Logs /app/wwwroot/media

# Set permissions
RUN chmod -R 755 /app

EXPOSE 8080

ENTRYPOINT ["dotnet", "UmbracoProject.dll"]