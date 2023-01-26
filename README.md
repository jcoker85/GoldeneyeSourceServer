# GoldeneyeSourceServer
Basic, customizable server for Goldeneye Source.
Full access to Goldeneye server files with volume mount. 

Example:
```
docker run --name GESourceSrv -p 27015:27015 -p 27015:27015/udp -p 27005:27005/udp -v ~/geserver:/servers/geserver jcoker85/goldeneyesourceserver 
```

You can pass in the starting map name and/or max player amount by passing these environment variables:
```
docker run --name GESourceSrv -e MAP=ge_caves -e MAXPLAYERS=10 -p 27015:27015 -p 27015:27015/udp -p 27005:27005/udp -v ~/geserver:/servers/geserver jcoker85/goldeneyesourceserver 
```

If you need to use different ports, you can add the port increment environment variable:
```
docker run --name GESourceSrv -e MAP=ge_caves -e MAXPLAYERS=10 -e PORT_INCREMENT=5 -p 27020:27020 -p 27020:27020/udp -p 27010:27010/udp -v ~/geserver:/servers/geserver jcoker85/goldeneyesourceserver 
```

Many thanks to ich777 for his base Wine image and excellent docker-steamcmd-server Docker project!
