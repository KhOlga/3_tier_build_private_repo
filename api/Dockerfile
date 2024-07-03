# CORE
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base

EXPOSE 80
EXPOSE 443

WORKDIR /app


# COMPILING
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

ARG BUILD_CONFIGURATION=Release
WORKDIR /src

#COPY ["Basic3TierAPI/Basic3TierAPI.csproj", "Basic3TierAPI/"]
COPY ["Basic3TierAPI.csproj", "Basic3TierAPI/"]
RUN dotnet restore "./Basic3TierAPI/Basic3TierAPI.csproj"

WORKDIR "/src/Basic3TierAPI"
COPY . .

RUN dotnet build "./Basic3TierAPI/Basic3TierAPI.csproj" -c $BUILD_CONFIGURATION -o /app/build


# RUNTIME
FROM build AS publish

ARG BUILD_CONFIGURATION=Release

RUN dotnet publish "./Basic3TierAPI/Basic3TierAPI.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false


# PUBLISHING
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS final

WORKDIR /app

COPY --from=publish /app/publish .

ENTRYPOINT ["dotnet", "Basic3TierAPI.dll"]