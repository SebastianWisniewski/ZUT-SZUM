
%Rysowanie linii
x1 = 0; x2 = 0; x3 = 1; y1 = .5; y2 = 1.5; y3 = 1;
xc = .5; yc = 1; zc = 2;

col1 = line([0 0], [.5 .5], [0 5]);
col2 = line([0 0], [1.5 1.5], [0 5]);
col3 = line([1 1], [1 1], [0 5]);

platforma = line(.5, 1, 2);

r = 1;
z1 = zc +sqrt(r^2-(x1-xc)^2-(y1-yc)^2);
arm1 = line([x1 xc], [y1 yc], [z1 zc]);

z2 = zc +sqrt(r^2-(x2-xc)^2-(y2-yc)^2);
arm2 = line([x2 xc], [y2 yc], [z2 zc]);

z3 = zc +sqrt(r^2-(x3-xc)^2-(y3-yc)^2);
arm3 = line([x3 xc], [y3 yc], [z3 zc]);

%Wynalezienie kola

set(arm1, 'XData', [x1 xc], 'Ydata', [y1 yc], 'Zdata', [z1 zc]);
set(arm2, 'XData', [x2 xc], 'Ydata', [y2 yc], 'Zdata', [z2 zc]);
set(arm3, 'XData', [x3 xc], 'Ydata', [y3 yc], 'Zdata', [z3 zc]);
z01 = 0;
z02 = 0;
z03 = 0;
fprintf(s,'x 8750 y 8750 z 8750\n');
fprintf(s,'x -8750 y -8750 z -8750\n');
pause(5);
for t = 0:.1:20
    
    xc = 0.1*sin(t)+0.5;
    yc = 0.1*cos(t)+1;
    zc = 2;
    z01 = z1;
    z02 = z2;
    z03 = z3;
  z1 = zc +sqrt(r^2-(x1-xc)^2-(y1-yc)^2)
arm1 = line([x1 xc], [y1 yc], [z1 zc]);

z2 = zc +sqrt(r^2-(x2-xc)^2-(y2-yc)^2)
arm2 = line([x2 xc], [y2 yc], [z2 zc]);

z3 = zc +sqrt(r^2-(x3-xc)^2-(y3-yc)^2)
arm3 = line([x3 xc], [y3 yc], [z3 zc]);


    set(arm1, 'XData', [x1 xc], 'Ydata', [y1 yc], 'Zdata', [z1 zc]);
    set(arm2, 'XData', [x2 xc], 'Ydata', [y2 yc], 'Zdata', [z2 zc]);
    set(arm3, 'XData', [x3 xc], 'Ydata', [y3 yc], 'Zdata', [z3 zc]);

    dz1 = z01-z1;
    dz2 = z02-z2;
    dz3 = z03-z3;
    av =[ 'x ' num2str(round(dz1*10000)) '  y ' num2str(round(dz2*10000)) ' z ' num2str(round(dz3*10000)) '\n' ]
    
    fprintf(s,av)
    pause(0.3)
    
end

return

s = serial('COM4');
s.BaudRate = 57600;
fopen(s);
fprintf(s,'x 200 y 10000 z -50\n');
['x ' num2str(dz1) ' y ' num2str(dz2) ' z ' num2str(dz3) '\n'];