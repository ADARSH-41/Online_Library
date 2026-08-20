<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 450px;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-size: 28px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
            font-size: 14px;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="number"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s;
        }
        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus,
        input[type="number"]:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 5px rgba(102, 126, 234, 0.5);
        }
        .error-message {
            color: #e74c3c;
            font-size: 12px;
            margin-top: 5px;
            display: none;
        }
        .success-message {
            color: #27ae60;
            font-size: 12px;
            margin-top: 5px;
            display: none;
        }
        button {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s;
        }
        button:hover {
            transform: translateY(-2px);
        }
        button:active {
            transform: translateY(0);
        }
        .login-link {
            text-align: center;
            margin-top: 20px;
            color: #666;
            font-size: 14px;
        }
        .login-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
        .confirmation-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }
        .modal-content {
            background: white;
            padding: 40px;
            border-radius: 10px;
            text-align: center;
            max-width: 400px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
        }
        .modal-content h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .modal-content p {
            color: #666;
            margin-bottom: 30px;
            line-height: 1.6;
        }
        .modal-buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
        }
        .modal-buttons button {
            flex: 1;
            padding: 10px;
            font-size: 14px;
        }
        .modal-buttons .cancel-btn {
            background: #95a5a6;
        }
        .modal-buttons .confirm-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Student Registration</h1>
        
        <c:if test="${not empty successMessage}">
            <div style="background: #d4edda; color: #155724; padding: 12px; border-radius: 5px; margin-bottom: 20px; text-align: center;">
                ${successMessage}
            </div>
        </c:if>
        
        <c:if test="${not empty errorMessage}">
            <div style="background: #f8d7da; color: #721c24; padding: 12px; border-radius: 5px; margin-bottom: 20px; text-align: center;">
                ${errorMessage}
            </div>
        </c:if>

        <form id="registrationForm" method="POST" action="${pageContext.request.contextPath}/register" onsubmit="return validateForm(event)">
            <div class="form-group">
                <label for="studentName">Student Name:</label>
                <input type="text" id="studentName" name="studentName" placeholder="Enter your full name" required>
                <div class="error-message" id="nameError">Please enter a valid name (2-50 characters)</div>
            </div>

            <div class="form-group">
                <label for="rollNumber">Roll Number:</label>
                <input type="text" id="rollNumber" name="rollNumber" placeholder="Enter your roll number" required>
                <div class="error-message" id="rollError">Roll number is required</div>
            </div>

            <div class="form-group">
                <label for="email">Email ID:</label>
                <input type="email" id="email" name="email" placeholder="Enter your email address" required>
                <div class="error-message" id="emailError">Please enter a valid email address</div>
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter a strong password" required>
                <div class="error-message" id="passwordError">Password must be at least 6 characters with uppercase, lowercase, and number</div>
            </div>

            <div class="form-group">
                <label for="repeatPassword">Repeat Password:</label>
                <input type="password" id="repeatPassword" name="repeatPassword" placeholder="Confirm your password" required>
                <div class="error-message" id="repeatPasswordError">Passwords do not match</div>
            </div>

            <button type="submit">Register</button>
        </form>

        <div class="login-link">
            Already have an account? <a href="${pageContext.request.contextPath}/login">Login here</a>
        </div>
    </div>

    <!-- Confirmation Modal -->
    <div class="confirmation-modal" id="confirmationModal">
        <div class="modal-content">
            <h2>Confirm Your Email</h2>
            <p>A confirmation email will be sent to:<br><strong id="emailDisplay"></strong></p>
            <p>Please check your email and click the confirmation link to complete your registration.</p>
            <div class="modal-buttons">
                <button type="button" class="cancel-btn" onclick="closeModal()">Cancel</button>
                <button type="button" class="confirm-btn" onclick="submitRegistration()">Confirm & Send</button>
            </div>
        </div>
    </div>

    <script>
        let formData = null;

        function validateForm(event) {
            event.preventDefault();
            
            // Clear all previous errors
            document.querySelectorAll('.error-message').forEach(el => el.style.display = 'none');
            
            let isValid = true;
            
            // Validate Student Name
            const studentName = document.getElementById('studentName').value.trim();
            if (studentName.length < 2 || studentName.length > 50) {
                document.getElementById('nameError').style.display = 'block';
                isValid = false;
            }
            
            // Validate Roll Number
            const rollNumber = document.getElementById('rollNumber').value.trim();
            if (!rollNumber) {
                document.getElementById('rollError').style.display = 'block';
                isValid = false;
            }
            
            // Validate Email
            const email = document.getElementById('email').value.trim();
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                document.getElementById('emailError').style.display = 'block';
                isValid = false;
            }
            
            // Validate Password
            const password = document.getElementById('password').value;
            const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d@$!%*?&]{6,}$/;
            if (!passwordRegex.test(password)) {
                document.getElementById('passwordError').style.display = 'block';
                isValid = false;
            }
            
            // Validate Repeat Password
            const repeatPassword = document.getElementById('repeatPassword').value;
            if (password !== repeatPassword) {
                document.getElementById('repeatPasswordError').style.display = 'block';
                isValid = false;
            }
            
            if (isValid) {
                // Show confirmation modal
                document.getElementById('emailDisplay').textContent = email;
                document.getElementById('confirmationModal').style.display = 'flex';
                formData = new FormData(document.getElementById('registrationForm'));
            }
            
            return false;
        }

        function closeModal() {
            document.getElementById('confirmationModal').style.display = 'none';
            formData = null;
        }

        function submitRegistration() {
            // Submit the form data to the server
            const form = document.getElementById('registrationForm');
            form.submit();
        }

        // Close modal when clicking outside of it
        window.addEventListener('click', function(event) {
            const modal = document.getElementById('confirmationModal');
            if (event.target === modal) {
                closeModal();
            }
        });
    </script>
</body>
</html>
