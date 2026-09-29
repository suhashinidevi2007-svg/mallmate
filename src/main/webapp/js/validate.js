function validateRegisterForm() {
  const username = document.forms["registerForm"]["username"].value.trim();
  const password = document.forms["registerForm"]["password"].value.trim();
  const email = document.forms["registerForm"]["email"].value.trim();
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

  if (username.length < 3) {
    alert("Username must be at least 3 characters.");
    return false;
  }
  if (password.length < 4) {
    alert("Password must be at least 4 characters.");
    return false;
  }
  if (!emailRegex.test(email)) {
    alert("Please enter a valid email address.");
    return false;
  }
  return true;
}

function validateFeedbackForm() {
  const message = document.forms["feedbackForm"]["message"].value.trim();
  if (message.length < 5) {
    alert("Feedback message is too short.");
    return false;
  }
  return true;
}