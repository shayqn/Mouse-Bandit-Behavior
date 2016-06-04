function setupLogging(logName)
    global logFileID
    baseName = [logName, '_', int2str(yyyymmdd(datetime)), '_'];
    fileCounter = 1;
    fName = [baseName, int2str(fileCounter), '.csv'];
    while (exist(fName, 'file'))
        fileCounter = fileCounter + 1;
        fName = [baseName, int2str(fileCounter), '.csv'];
    end
    [FileName,PathName] = uiputfile(fName,'Save log file' );
    fName = fullfile(PathName,FileName);
    logFileID = fopen(fName, 'w');
end
