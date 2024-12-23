FROM python:3.11-alpine3.18

# 其他指令，比如 LABEL、ENV、EXPOSE 等按需求依次书写

RUN set -eux && \
        apk --no-cache update && apk -U --no-cache add git && \
        mkdir -p /usr/src/myapp/ && \
        git clone https://github.com/chenleidaye/Emby_Notifier.git /usr/src/myapp/ && \
        python3 -m pip install --no-cache-dir requests colorlog aiohttp -q; 

# 后续的 ENTRYPOINT 和 CMD 等指令
ENTRYPOINT ["python3"]
CMD ["/usr/src/myapp/main.py"]
