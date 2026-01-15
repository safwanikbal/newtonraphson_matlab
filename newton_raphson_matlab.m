% This code uses the newton-raphson method to find the root of an equation. 



%Inputs are:

%replace sample inputs with personalized values

func = @(x) x^2 - 2;           % the function you want to find the root of, passed as anonymous function
func_deriv = @(x) 2*x;         % the derivative of the function you want to find the root of, passed as anonymous function
initial_guess = 1;             % the initial guess to start newton's method
tol = 1e-6;                    % the desired tolerance

% Outputs are:
% root - a vector of the predicted root for each step
% errors - a vector of the error of each step 
% iterations - total number of steps 


err = 1; % pre-allocate the error
n = 1; % Start on step one
n_max = 1000; % Put an iteration limit

root(n) = initial_guess;
errors(n) = err;

while errors(n) > tol && n < n_max    

    if func_deriv(root(n)) == 0
        error('Derivative is zero. Newton-Raphson fails.');
    end

        % Calculate the new root guess
        root_new = root(n) - (func(root(n))) / (func_deriv(root(n)));
       
        % Calculate the error
        err = abs((root_new - root(n)) / root_new);

        % Update root and error vectors
        n = n + 1; % Increment iteration counter
        root(n) = root_new; % Store new root guess
        errors(n) = err; % Store error value
    


end

fprintf('Newton-Raphson Results:\n');
fprintf('Final root value: %.6f\n', root(end));
fprintf('Final error: %.6e\n', errors(end));
fprintf('Number of iterations: %d\n', length(root));


