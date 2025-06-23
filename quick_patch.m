function quick_patch(t,x,w,colorstr)
patch([t;flipud(t)]', [x+w;flipud(x-w)],colorstr,'FaceAlpha',0.1,'EdgeColor','none')
end

