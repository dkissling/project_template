% Zellulärer Automat zur Simulation der Umgebungsvariablen (hauptsächlich
% Pheromone.
% Testversion 1

n = 100;
Feld = zeros(n,n);
Feld(5:15,5) = 90:100;


while 1
    
    Feld = Feld -1;
    feldu = zeros(n+2,n+2);
    feldu(1:n,2:n+1) = max(0,floor(Feld/2));
    feldr = zeros(n+2,n+2);
    feldr(2:n+1,3:n+2) = max(0,floor(Feld/2));
    feldd = zeros(n+2,n+2);
    feldd(3:n+2,2:n+1) = max(0,floor(Feld/2));
    feldl = zeros(n+2,n+2);
    feldl(2:n+1,1:n) = max(0,floor(Feld/2));
    
    Feld = max(Feld,feldu(2:n+1,2:n+1));
    Feld = max(Feld,feldr(2:n+1,2:n+1));
    Feld = max(Feld,feldd(2:n+1,2:n+1));
    Feld = max(Feld,feldl(2:n+1,2:n+1));
    
end