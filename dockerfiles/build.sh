sudo docker build --force-rm -f env.dockerfile -t pa2:latest .
sudo docker run --gpus '"device=0"' --cpuset-cpus=0-23 -m 12g --shm-size=16g -it -v /home/dblab/ML/DL_PA2:/home/DL_PA2 --name pa2 pa2:latest
