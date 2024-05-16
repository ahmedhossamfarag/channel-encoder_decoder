function writeVod(name, pkts, wrdLn, vodSz, fr)
    %	reconstructs the video stream 
    vod = reshape(uint8(bi2de(reshape(pkts, [], wrdLn))), vodSz);
    %	saves the corresponding video file
    writer = VideoWriter(name);
    writer.FrameRate = fr;
    open(writer)
    writeVideo(writer, vod)
    close(writer)
end