#!/bin/bash
dotnet --info
dotnet restore

for path in src/**/*.csproj; do
    dotnet build -f netstandard1.3 -c Release ${path} -p:EnableSourceLink=true
done

for path in test/*.Tests/*.csproj; do
    dotnet test -f netcoreapp2.0  -c Release ${path}
done
