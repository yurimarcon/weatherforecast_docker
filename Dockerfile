FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /App

COPY ./dist ./

FROM mcr.microsoft.com/dotnet/aspnet:6.0
COPY --from=build-env /App .
ENTRYPOINT ["dotnet", "api_dotnet.dll"]