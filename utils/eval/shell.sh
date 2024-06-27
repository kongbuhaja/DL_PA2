util=/home/DL_PA2/utils/eval/
save=${util}comparison/

python3 ${util}kaisteval.py --annFile ${util}KAIST_annotation.json \
                            --rstFiles ${save}yolov5n_base.json \
                                       ${save}yolov5n_new_anchor.json \
                                       ${save}yolov5n_samp_anchor.json \
                                       ${save}yolov5n_base_more.json \
                            --evalFig ${save}mr_benchmark.jpg
