# Use a base image
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

# Set the working directory
WORKDIR /app

# Copy the .csproj file and restore dependencies
COPY Basic3Tier.Infrastructure/Basic3Tier.Infrastructure.csproj ./Basic3Tier.Infrastructure/
RUN dotnet restore ./Basic3Tier.Infrastructure/Basic3Tier.Infrastructure.csproj

# Copy the remaining files and build the application
COPY . .
RUN dotnet build ./Basic3Tier.Infrastructure/Basic3Tier.Infrastructure.csproj -c Release -o out

# Publish the application
RUN dotnet publish ./Basic3Tier.Infrastructure/Basic3Tier.Infrastructure.csproj -c Release -o /app/publish

# Use a runtime image
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app/publish .

# Set the entry point
ENTRYPOINT ["dotnet", "Basic3Tier.Infrastructure.dll"]
