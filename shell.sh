start_background_task() {
    local path="models/yolov5n_kaist-rgbt"
    local cfg="${path}${1}.yaml"
    local name="yolov5n${1}"
    nohup python3 train_simple.py \
            --img 640 \
            --batch-size 64 \
            --epochs 300 \
            --cfg "${cfg}" \
            --weights runs/train/yolov5n2/weights/ap_best.pt \
            --rgbt \
            --metric "${2}" \
            --name "${name}" > "${name}.log" 2>&1 &
}

wait_for_completion() {
    local path="models/yolov5n_kaist-rgbt"
    local cfg="${path}${1}.yaml"
    local name="yolov5n${1}"
    while pgrep -f "python3 train_simple.py --img 640 --batch-size 64 --epochs 600 --cfg ${cfg} --weights runs/train/yolov5n2/weights/ap_best.pt --rgbt --metric ${2} --name ${name}" > /dev/null; do
        sleep 30
    done
}

task() {
  start_background_task "$1" "$2"
  wait_for_completion "$1" "$2"
}

# task "" "map"
# task "_anchors" "map"
# task "_sq_anchors" "map"
# task "" "mr"
# task "_anchors" "mr"
# task "" "hybrid"
# task "_anchors" "hybrid"

sh utils/eval/shell.sh