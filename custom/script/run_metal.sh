python \
train.py --epochs 30 --batch 16 --device $1 \
--hyp custom/hyp/hyp.scratch.yaml --data custom/data/metal.yaml \
--img-size 1280 --weight $2 \
--name $3 \
--save_period 1 

# --image-weights --label-smoothing 0.1

#-m torch.distributed.launch --nproc_per_node 4 \

# \
# --cache \
# --image-weights \
# --multi-scale \
# --label-smoothing 0.1 \ 
# --sync-bn \
# --adam %
