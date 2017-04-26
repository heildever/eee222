function C = Capacitance_per_length(Er,d,D,Eo)

C=pi*Er*Eo/log(D/d+sqrt((D/d)^2-1));
end

