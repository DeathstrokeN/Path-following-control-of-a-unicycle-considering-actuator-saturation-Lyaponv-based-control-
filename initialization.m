%sim("model.slx")
m = s1;

set_param('model','SimulationCommand','start')
pause(1)

while(out.tout(end) ~= 100)

        set_param('model','SimulationCommand','start')

        if(strcmp(get_param('model','SimulationStatus'), 'paused'))
         if (abs(s1) < 1)
             s = s+1;
             break;
             
         end
        [Xrab,Yrab,ThetaRef,Cc,g,s1,y1]=SplinePath(s,out.x(end),out.y(end));
        out.tout(end)
        set_param('model','SimulationCommand','continue')
        pause(0.1)
        s1
         y1
%Cc

        end
    start = 0;
end
plot(out.x,out.y)