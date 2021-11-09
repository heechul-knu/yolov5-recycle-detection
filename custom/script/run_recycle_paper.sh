#  -m torch.distributed.launch --nproc_per_node 4

python -m torch.distributed.launch --nproc_per_node 4 train.py --save_period 1 \
--device 4,5,6,7 --batch-size 16 --epochs 30 --data ./custom/data/recycle.yaml --imgsz 1280 --weights yolov5x6.pt \
--hyp custom/hyp/hyp.scratch.yaml --name 0928_x6_base

python -m torch.distributed.launch --nproc_per_node 4 train.py \
--device 4,5,6,7 --batch-size 16 --epochs 30 --data ./custom/data/recycle.yaml --imgsz 1280 --weights yolov5x6.pt \
--hyp custom/hyp/hyp.scratch_imb.yaml --name 0928_x6_base_imb

python -m torch.distributed.launch --nproc_per_node 4 train.py \
--device 4,5,6,7 --batch-size 16 --epochs 30 --data ./custom/data/recycle.yaml --imgsz 1280 --weights yolov5x6.pt \
--hyp custom/hyp/hyp.scratch_bcutmix.yaml --name 0928_x6_base_bcutmix

python -m torch.distributed.launch --nproc_per_node 4 train.py \
--device 4,5,6,7 --batch-size 16 --epochs 30 --data ./custom/data/recycle.yaml --imgsz 1280 --weights yolov5x6.pt \
--hyp custom/hyp/hyp.scratch_bcutmix_imb.yaml --name 0928_x6_base_bcutmix_imb