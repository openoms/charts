FROM lightninglabs/lnd:v0.14.3-beta as lnd

FROM alpine/k8s:1.21.5

COPY --from=lnd /bin/lncli /bin/lncli

RUN apk --update add expect curl jq

ENTRYPOINT []
