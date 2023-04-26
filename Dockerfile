ARG dotnet_version=6.0-alpine
FROM mcr.microsoft.com/dotnet/sdk:${dotnet_version}

ARG dotnet_format_version=5.1.225507

ENV PATH="${PATH}:/opt/dotnet-format"

RUN apk add \
    bash \
    coreutils
RUN dotnet tool install dotnet-format --tool-path /opt/dotnet-format --version ${dotnet_format_version} --add-source https://dotnet.myget.org/F/format/api/v3/index.json

# Suppress a warning about this folder not existing.
# There will still be warnings due to missing packages, but
# pre-commit doesn't support mounting additional volumes like
# the NuGet cache folder.
RUN mkdir -p /usr/share/dotnet/sdk/NuGetFallbackFolder

ADD dotnet-format-wrapper /usr/bin/dotnet-format-wrapper

ENTRYPOINT ["/usr/bin/dotnet-format-wrapper"]
