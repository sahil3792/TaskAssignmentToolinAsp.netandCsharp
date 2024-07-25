function showSignup() {
    var signInForm = document.querySelector('.sign-in-form');
    var signUpForm = document.querySelector('.sign-up-form');

    if (signInForm && signUpForm) {
        signInForm.style.display = 'none';
        signUpForm.style.display = 'block';

        // Optionally, you can add a class to the container for styling purposes
        document.querySelector('.container').classList.add('sign-up-mode');
    }
}

function showSignin() {
    var container = document.querySelector('.container');

    if (container) {
        // Remove the sign-up mode class to revert to sign-in form
        container.classList.remove('sign-up-mode');

        // Optionally, show the sign-in form explicitly if needed
        var signInForm = document.querySelector('.sign-in-form');
        var signUpForm = document.querySelector('.sign-up-form');

        if (signInForm && signUpForm) {
            signInForm.style.display = 'block';
            signUpForm.style.display = 'none';
        }
    }
}
