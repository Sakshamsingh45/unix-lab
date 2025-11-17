#!/bin/bash
# ==========================================
# Simple News Fetcher (Improved Version)
# ==========================================

# BBC RSS Feed URLs
GENERAL_FEED="https://feeds.bbci.co.uk/news/rss.xml"
TECH_FEED="https://feeds.bbci.co.uk/news/technology/rss.xml"
SPORTS_FEED="https://feeds.bbci.co.uk/sport/rss.xml"
BUSINESS_FEED="https://feeds.bbci.co.uk/news/business/rss.xml"
ENTERTAINMENT_FEED="https://feeds.bbci.co.uk/news/entertainment_and_arts/rss.xml"
HEALTH_FEED="https://feeds.bbci.co.uk/news/health/rss.xml"
SCIENCE_FEED="https://feeds.bbci.co.uk/news/science_and_environment/rss.xml"

# Function to fetch and display headlines
fetch_news() {
    FEED_URL="$1"
    CATEGORY="$2"

    clear
    echo "=============================================="
    echo "Latest '$CATEGORY' News Headlines"
    echo "=============================================="
    echo

    # Fetch feed and extract top 10 titles
    curl -s "$FEED_URL" \
    | grep -o '<title><!\[CDATA\[[^]]*\]\]>' \
    | sed 's/<title><!\[CDATA\[//;s/\]\]>//' \
    | sed '1d' \
    | head -n 10 \
    | nl -w2 -s". "

    echo
    echo "----------------------------------------------"
    read -p "Press Enter to return to the main menu..."}

# Menu
while true; do
    clear
    echo "=============================================="
    echo "         TERMINAL NEWS CENTER"
    echo "=============================================="
    echo "1. General"
    echo "2. Technology"
    echo "3. Sports"
    echo "4. Business"
    echo "5. Entertainment"
    echo "6. Health"
    echo "7. Science"
    echo "8. Exit"
    echo "----------------------------------------------"
    read -p "Enter your choice (1-8): " choice

    case $choice in
        1) fetch_news "$GENERAL_FEED" "General" ;;
        2) fetch_news "$TECH_FEED" "Technology" ;;
        3) fetch_news "$SPORTS_FEED" "Sports" ;;
        4) fetch_news "$BUSINESS_FEED" "Business" ;;
        5) fetch_news "$ENTERTAINMENT_FEED" "Entertainment" ;;
        6) fetch_news "$HEALTH_FEED" "Health" ;;
        7) fetch_news "$SCIENCE_FEED" "Science" ;;
        8) echo "Thank you for using the News Center!"; exit 0 ;;
        *) echo "Invalid choice! Please try again."; sleep 1 ;;
    esac
done
