python -m torch.distributed.launch --nproc_per_node 8 \
--master_port $1 \
train.py --epochs 30 --batch 32 \
--hyp custom/hyp/hyp.scratch_bcutmix.yaml --data custom/data/recycle.yaml \
--img-size 1280 --save_period 1 \
--device $2 \
--weight $3 \
--name $4

#  --cache
#  --hyp custom/hyp/hyp.finetune_full.yaml --data custom/data/recycle.yaml \
# -m torch.distributed.launch --nproc_per_node 4 \

# \
# --cache \
# --image-weights \
# --multi-scale \
# --label-smoothing 0.1 \ 
# --sync-bn \
# --adam %
