# Use a base image
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

# Set the working directory
WORKDIR /app

COPY . .


RUN dotnet restore ./Basic3TierAPI/Basic3TierAPI.csproj


# Use a runtime image
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app/publish .

# Set the entry point
ENTRYPOINT ["dotnet", "Basic3TierAPI.dll"]
