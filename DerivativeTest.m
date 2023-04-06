syms r th;
phi = [r*cos(th)*cos(exp(-r))+r*sin(th)*sin(exp(-r));  -r*cos(th)*sin(exp(-r))+r*sin(th)*cos(exp(-r))];
grad = diag(jacobian(phi,[r,th]));
grad(2,:) = grad(2,:)/r;
DF = grad*grad';
Diff = DF-[1 0; 0 1];
Diff

