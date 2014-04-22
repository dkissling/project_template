% Ant-agent for bringing food back to base


point = pos(1:2,Index);
p = phi(Index);

dir = round(point+[-sin(p * pi); cos(p * pi)]);
if max(dir) < n && min(dir) > 1
    %suche nach dem h�chsten Pheromonwert (auf Field_2) in Bewegungsrichtung    
    DirField = Field_2((dir(1)-1):(dir(1)+1),(dir(2)-1):(dir(2)+1));
    
    [row_val,row_ind] = max(DirField);
    [col_val,col_ind] = max(row_ind);
    
    dir = [row_ind(col_ind);col_ind]-([2;2]-(dir-point));
    if norm(dir) ~= 0
        
        dir = dir/norm(dir);        
        p = atan2(-dir(1),dir(2))/pi;
        p = mod(p,2);
    else
        % p (phi) bleibt gleich
    end
    
else
    PheroDir;
end


%M�gliche Drehung
odd = rand(1);

if odd < turn_odd
    p = p + turn;
elseif odd < 2*turn_odd
    p = p - turn;
else
    %straight
end



%Schritt
direction = round([-sin(p * pi); cos(p * pi)]);

% Index not out of bounds
if max(point + direction) < n && min(point + direction) > 1
    
    % Zuweisen der Koordinaten und des Winkels Phi
    pos(1:2,Index) = point + direction;
    
    
    %Field_1(point(1),point(2)) = Field_1(point(1),point(2)) + 2;
else
    
    % other direction
    p = mod(p + 0.8,2);
            
end

%R�ckkehr zur Base
if Field_0(pos(1,Index),pos(2,Index)) == 1
    %Die Ameise kehrt in den Suchmodus zur�ck
    carries_food(Index) = 0; 
    %Dieser Wert kann je nach Nahrungsquelle angepasst werden.
    food_counter = food_counter + 1; 
    %Die Ameise wendet
    phi(Index) = mod(p + 0.8,2);
else
    phi(Index) = p;
end