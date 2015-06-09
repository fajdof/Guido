function [  ] = generateGcode(  )
global g_positions;
ime_datoteke=uiputfile;
% napravi datoteku za g-kod
g_dat=fopen(ime_datoteke,'w');
x_length=str2double(g_positions.x_position)/str2double(g_positions.x_step);
x_len=uint32(x_length)+1;
y_length=str2double(g_positions.y_position)/str2double(g_positions.y_step);
y_len=uint32(y_length)+1;
% zapisi korake i duljinu u datoteku
fprintf(g_dat, '%s', '%Generated g-code, x_step ',g_positions.x_step,' mm, y_step ',g_positions.y_step,' mm, x_length ',g_positions.x_position,' mm, y_length ',g_positions.y_position,' mm');
fprintf(g_dat,'\n');
fprintf(g_dat, '%s\n', 'G21');
fprintf(g_dat, '%s\n', 'G91');
down=0;
% generiraj g-kod
for m = 1:x_len
    down=xor(down,1);
    for n = 1:y_len
       if (n~=y_len)&&(down==1)
           fprintf(g_dat, '%s', 'G00 ');
           fprintf(g_dat, '%s', 'X0 ');
           fprintf(g_dat, '%s', 'Y-',g_positions.y_step,' ');
           fprintf(g_dat, '%s\n', 'Z0');
           fprintf(g_dat, '%s\n', 'M50');
       end
       if (n~=y_len)&&(down==0)
           fprintf(g_dat, '%s', 'G00 ');
           fprintf(g_dat, '%s', 'X0 ');
           fprintf(g_dat, '%s', 'Y',g_positions.y_step,' ');
           fprintf(g_dat, '%s\n', 'Z0');
           fprintf(g_dat, '%s\n', 'M50');
       end
       if (n==y_len)&&(down==1)&&(m~=x_len)
           fprintf(g_dat, '%s', 'G00 ');
           fprintf(g_dat, '%s', 'X',g_positions.x_step,' ');
           fprintf(g_dat, '%s', 'Y0 ');
           fprintf(g_dat, '%s\n', 'Z0');
           fprintf(g_dat, '%s\n', 'M50');
       end
       if (n==y_len)&&(down==0)&&(m~=x_len)
           fprintf(g_dat, '%s', 'G00 ');
           fprintf(g_dat, '%s', 'X',g_positions.x_step,' ');
           fprintf(g_dat, '%s', 'Y0 ');
           fprintf(g_dat, '%s\n', 'Z0');
           fprintf(g_dat, '%s\n', 'M50');
       end
    end
end
fprintf(g_dat, '%s', 'M00');
save('g_dat');
end

