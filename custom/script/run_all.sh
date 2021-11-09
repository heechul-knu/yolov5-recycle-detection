./custom/script/run_agc2021.sh 65001 0,1,2,3,4,5,6,7 custom/weights/recycle_s6_last_coco_neck-det.pt agc2021_s6_last_coco-neck-det
./custom/script/run_agc2021.sh 65001 0,1,2,3,4,5,6,7 custom/weights/recycle_m6_last_coco_neck-det.pt agc2021_m6_last_coco-neck-det
./custom/script/run_recycle.sh 65001 0,1,2,3,4,5,6,7 yolov5l6.pt recycle_l6_last
./custom/script/run_agc2021.sh 65001 0,1,2,3,4,5,6,7 custom/weights/recycle_l6_last_coco_neck-det.pt agc2021_l6_last_coco-neck-det


# ./custom/script/run_agc2021.sh 65001 0,1,2,3,4,5,6,7 custom/weights/recycle_x6_bboxcutmix_coco_det.pt agc2021_x6_last_coco-det
# ./custom/script/run_agc2021.sh 65001 0,1,2,3,4,5,6,7 custom/weights/recycle_x6_bboxcutmix_all.pt agc2021_x6_last_init-all

# ./custom/script/run_agc2021.sh 65001 0,1,2,3,4,5,6,7 custom/weights/recycle_s6_last_coco_det.pt agc2021_s6_last_coco-det
# ./custom/script/run_agc2021.sh 65001 0,1,2,3,4,5,6,7 custom/weights/recycle_s6_last_all.pt agc2021_s6_last_init-all

# ./custom/script/run_agc2021.sh 65001 0,1,2,3,4,5,6,7 custom/weights/recycle_m6_last_coco_det.pt agc2021_m6_last_coco-det
# ./custom/script/run_agc2021.sh 65001 0,1,2,3,4,5,6,7 custom/weights/recycle_m6_last_all.pt agc2021_m6_last_init-all

# ./custom/script/run_agc2021.sh 65001 0,1,2,3,4,5,6,7 custom/weights/recycle_l6_last_coco_det.pt agc2021_l6_last_coco-det
# ./custom/script/run_agc2021.sh 65001 0,1,2,3,4,5,6,7 custom/weights/recycle_l6_last_all.pt agc2021_l6_last_init-all



