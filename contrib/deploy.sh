cd takwimu/takwimu_ui && yarn build && \
cd ../.. && git add . && (git diff-index --quiet HEAD || (git commit -m "Deploy $(date --iso-8601=minutes)")) && \
git push -f dokku deploy:master
