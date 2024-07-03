# CORE
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base

EXPOSE 80
EXPOSE 443

WORKDIR /app


# COMPILER
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

WORKDIR /src

COPY Basic3TierAPI/Basic3TierAPI.csproj Basic3TierAPI/

COPY . .

WORKDIR "/src/Basic3TierAPI"
RUN dotnet restore "Basic3TierAPI/Basic3TierAPI.csproj"

RUN dotnet build -o /app/build

FROM build AS publish
RUN dotnet publish -o /app/publish


# RUNTIME
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS final

WORKDIR /app

# PUBLISHING
COPY --from=publish /app/publish .

ENTRYPOINT ["dotnet", "Basic3TierAPI.dll"]