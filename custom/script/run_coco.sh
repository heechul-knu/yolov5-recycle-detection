python \
train.py --epochs 300 --batch 32 --cfg yolov5m6.yaml --weights '' --img-size 1280 \
--data custom/data/coco.yaml --hyp custom/hyp/hyp.scratch_imb.yaml \
--device $1 \
--name $2 \
--save_period 1 

# --cache

#-m torch.distributed.launch --nproc_per_node 4 \

# \
# --cache \
# --image-weights \
# --multi-scale \
# --label-smoothing 0.1 \ 
# --sync-bn \
# --adam %
