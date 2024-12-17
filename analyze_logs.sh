#!/bin/bash
LOG_FILE="access.log"
REPORT_FILE="report.txt"

total_requests=$(cat "$LOG_FILE" | wc -l)

unique_ips=$(awk '{print $1}' "$LOG_FILE" | sort | uniq | wc -l)

methods=$(awk '{print $6}' "$LOG_FILE" | sort | uniq -c)

most_popular_url=$(awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -1)

echo "Отчет о логе веб-сервера" > "$REPORT_FILE"
echo "=========================" >> "$REPORT_FILE"
echo "Общее количество запросов: $total_requests" >> "$REPORT_FILE"
echo "Количество уникальных IP-адресов: $unique_ips" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "Количество запросов по методам:" >> "$REPORT_FILE"
echo "$methods" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "Самый популярный URL: $most_popular_url" >> "$REPORT_FILE"
