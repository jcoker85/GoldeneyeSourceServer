# GoldeneyeSourceServer
Basic, customizable server for Goldeneye Source

Example:
```
docker run --name GESourceSrv -p 27020:27020 -p 27020:27020/udp -v ~/geserver:/servers/geserver jcoker85/goldeneyesourceserver 
```

You can pass in the starting map name by passing an environment variable:
```
docker run --name GESourceSrv -e MAP=ge_archives -p 27020:27020 -p 27020:27020/udp -v ~/geserver:/servers/geserver jcoker85/goldeneyesourceserver 
```

Many thanks to ich777 for his base Wine image and contribution to game server hosting on Unraid OS. 
