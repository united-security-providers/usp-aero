# Flags a link from a frozen release into any component's `latest`.
#
# Call as: awk -v prefix=<base URL path> -f frozen-links.awk <index.html>...

/<article[^>]*usp-prose/ { prose = 1 }

prose {
  rest = $0
  while (match(rest, /href="[^"]*"/)) {
    href = substr(rest, RSTART + 6, RLENGTH - 7)
    if (href ~ "/" prefix "/[^/]+/latest/") {
      printf "%s:%d: links to %s\n", FILENAME, FNR, href
      found = 1
    }
    rest = substr(rest, RSTART + RLENGTH)
  }
}

/<\/article>/ { prose = 0 }

END { exit found ? 1 : 0 }
