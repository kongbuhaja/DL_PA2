run=/home/DL_PA2/runs/val/
save=/home/DL_PA2/runs/train/
util=/home/DL_PA2/utils/eval/

python3 ${util}kaisteval.py --annFile ${util}KAIST_annotation.json \
                            --rstFiles ${save}/yolov5n2/epoch296_predictions.json \
                                       ${save}/yolov5n2/epoch28_predictions.json \
                                       ${save}/yolov5n2/epoch100_predictions.json \
                            --evalFig "${run}ap_benchmark.jpg"