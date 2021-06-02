function outData = interpData(inData,xInterp)

    InfNaNidx = isinf(inData(:,2)) + isnan(inData(:,2));
    outData = interp1(inData(~InfNaNidx,1),inData(~InfNaNidx,2),xInterp,'spline',NaN); 
    NaNidx = isnan(outData);
    outData(NaNidx) = interp1(xInterp(~NaNidx),outData(~NaNidx),xInterp(NaNidx),'nearest','extrap');