websites=(
  "https://google.com"
  "https://facebook.com"
  "https://twitter.com"
  "https://not_adress.com"
)

log_file="website_status.log"

for site in "${websites[@]}"; do
  status_code=$(curl -s -o /dev/null -w "%{http_code}" -L "$site")

  if [ "$status_code" -eq 200 ]; then
    echo "<$site> is UP" | tee -a "$log_file"
  else
    echo "<$site> is DOWN" | tee -a "$log_file"
  fi
done

echo "Results were saved in $log_file"