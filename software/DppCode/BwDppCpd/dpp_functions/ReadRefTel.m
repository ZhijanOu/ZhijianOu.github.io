function SegRef=ReadRefTel(filename)
    fid=fopen([filename,'.txt']);
    SegRef=textscan(fid,'%f %f %s');
    fclose(fid);
    SegRef=[SegRef{1};SegRef{2}];
    SegRef=unique(SegRef);
    SegRef=sort(SegRef);