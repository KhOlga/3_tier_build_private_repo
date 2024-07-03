# CORE
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base

WORKDIR /app

EXPOSE 80
EXPOSE 443


# COMPILER
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

# Set the working directory
WORKDIR /src

COPY . .

RUN dotnet restore ./Basic3TierAPI/Basic3TierAPI.csproj

WORKDIR "/src/Basic3TierAPI"

RUN dotnet build -c Release -o /app/build


# RUNTIME
FROM build AS publish

RUN dotnet publish -c Release -o /app/publish /p:UseAppHost=false


# RUN
FROM base AS final

WORKDIR /app

COPY --from=publish /app/publish .

ENTRYPOINT ["dotnet", "Basic3TierAPI.dll"]