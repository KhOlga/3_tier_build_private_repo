# CORE
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base

EXPOSE 80
EXPOSE 443

WORKDIR /app


# COMPILING
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

RUN dotnet new sln
WORKDIR /src

COPY Basic3TierAPI/Basic3TierAPI.csproj Basic3TierAPI/
RUN dotnet restore "./Basic3TierAPI/Basic3TierAPI.csproj"

COPY Basic3Tier.Core/Basic3Tier.Core.csproj Basic3Tier.Core/
RUN dotnet restore "./Basic3Tier.Core/Basic3Tier.Core.csproj"

COPY Basic3Tier.Infrastructure/Basic3Tier.Infrastructure.csproj Basic3Tier.Infrastructure/
RUN dotnet restore "./Basic3Tier.Infrastructure/Basic3Tier.Infrastructure.csproj"

COPY . ./

WORKDIR "/src/Basic3TierAPI"
RUN dotnet build -c Release -o /app/build


# RUNTIME
FROM build AS publish

WORKDIR /src
RUN dotnet publish "./Basic3TierAPI/Basic3TierAPI.csproj" -o /app/publish


# PUBLISHING
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS final

WORKDIR /app

COPY --from=publish /app/publish .

ENTRYPOINT ["dotnet", "Basic3TierAPI.dll"]