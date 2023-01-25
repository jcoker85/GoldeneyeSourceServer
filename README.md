# GoldeneyeSourceServer
Basic, customizable server for Goldeneye Source

Example:
```
docker run --name GESourceSrv -p 27020:27020 -p 27020:27020/udp -v ~/geserver:/servers/geserver jcoker85/goldeneyesourceserver 
```

You can pass in the starting map name and/or max player amount by passing these environment variables:
```
docker run --name GESourceSrv -e MAP=ge_caves -e MAXPLAYERS=10 -p 27020:27020 -p 27020:27020/udp -v ~/geserver:/servers/geserver jcoker85/goldeneyesourceserver 
```

If you need to use different ports, you can add the port increment environment variable:
```
docker run --name GESourceSrv -e MAP=ge_caves -e MAXPLAYERS=10 -e PORT_INCREMENT=5 -p 27025:27025 -p 27025:27025/udp -v ~/geserver:/servers/geserver jcoker85/goldeneyesourceserver 
```

Many thanks to ich777 for his base Wine image and contribution to game server hosting on Unraid OS. 
