// Load live stats (registered users + visit count) without a page refresh
function loadActiveUsers() {
  fetch("activeUsers")
    .then(res => res.json())
    .then(data => {
      const box = document.getElementById("statsBox");
      if (box) {
        box.innerHTML = "Registered users: " + data.totalUsers +
                         " &nbsp;|&nbsp; Your visits: " + data.visitCount;
      }
    })
    .catch(err => console.error("Stats load failed", err));
}

// XPath-backed conditional feedback search, called from feedback.jsp
function searchFeedback() {
  const minRating = document.getElementById("minRating").value;
  fetch("feedbackSearch?minRating=" + encodeURIComponent(minRating))
    .then(res => res.json())
    .then(data => {
      const resultsDiv = document.getElementById("feedbackResults");
      if (data.length === 0) {
        resultsDiv.innerHTML = "<p>No feedback found for this rating.</p>";
        return;
      }
      let html = "<table><tr><th>Name</th><th>Message</th><th>Rating</th></tr>";
      data.forEach(f => {
        html += "<tr><td>" + f.name + "</td><td>" + f.message + "</td><td>" + f.rating + "</td></tr>";
      });
      html += "</table>";
      resultsDiv.innerHTML = html;
    })
    .catch(err => console.error("Feedback search failed", err));
}

// Async email format check via PHP (needs a PHP server - see README)
function checkEmailWithPhp() {
  const email = document.getElementById("fbEmail").value;
  fetch("php/validate.php?email=" + encodeURIComponent(email))
    .then(res => res.json())
    .then(data => {
      const msg = document.getElementById("emailCheckMsg");
      msg.textContent = data.valid ? "Email format OK" : "Invalid email format";
      msg.style.color = data.valid ? "#2e7d32" : "#c62828";
    })
    .catch(() => {
      const msg = document.getElementById("emailCheckMsg");
      msg.textContent = "PHP validator not reachable (see README)";
      msg.style.color = "#c62828";
    });
}