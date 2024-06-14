start_background_task() {
    local path="models/yolov5n_nuscenes"
    local cfg="${path}${1}.yaml"
    local name="yolov5n${1}"
    nohup python3 train_simple.py \
            --img 416 \
            --batch-size 64 \
            --epochs 1000 \
            --cfg "${cfg}" \
            --weights yolov5n.pt \
            --name "${name}" > "${name}.log" 2>&1 &
}

wait_for_completion() {
    local path="models/yolov5n_nuscenes"
    local cfg="${path}${1}.yaml"
    local name="yolov5n${1}"
    while pgrep -f "python3 train_simple.py --img 416 --batch-size 64 --epochs 1000 --cfg ${cfg} --weights yolov5n.pt --name ${name}" > /dev/null; do
        sleep 5
    done
}

task() {
  start_background_task "$1"
  wait_for_completion "$1"
}

task ""
task 0.3
task 0.5
task 0.7
task 1.0

task C2f
task C2fC
task C3x

# python3 detect.py \
#   --img 416 \
#   --source datasets/nuscenes/test/images \
#   --data data/nuscenes.yaml \
#   --weights runs/train/yolov5n0.54/weights/best.pt \
#   --name yolov5n_trained
