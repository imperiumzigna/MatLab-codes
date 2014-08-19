function interface_puro_codigo
interface=figure();
botao=uicontrol('Parent',interface,'Style','pushbutton','String','Clique Aqui','Position',[0.2 0.2 0.4 0.2],'Units','normalized');
set(botao,'Callback',@acao);
end
function acao(~,~)
msgbox('Hello');
end



