# Creates a file to capture standard out
rm -rf npm_install_output.txt
touch npm_install_output.txt

# Run NPM install (Mentions vulnerabilities at the end). Output goes into file.
npm install >> npm_install_output.txt

# Catch all vulnerabilities
# search_term="found [0-9]{1,6} vulnerabilities ([0-9]{1,6} low, [0-9]{1,6} moderate, [0-9]{1,6} high)"

# Only high vulnerabilities
search_term=", [0-9]{1,6} high)"

if grep -REo "$only_high_vulnerabilities" npm_install_output.txt
then
  if ! grep -o "found 0 vulnerabilities" npm_install_output.txt
  then
    echo "Yes, security vulnerabilities found."
    exit 1
  fi
fi

echo "No, security vulnerabilities found."
