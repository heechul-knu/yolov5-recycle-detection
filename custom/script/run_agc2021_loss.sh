python train.py --epochs 30 --batch 32 \
--hyp custom/hyp/hyp.scratch_bcutmix_loss.yaml --data custom/data/agc2021.yaml \
--img-size 1280 --save_period 1 \
--device $1 \
--weight $2 \
--name $3

# --cache
# -m torch.distributed.launch --nproc_per_node 4 \
# --cache \
# --image-weights \
# --multi-scale \
# --label-smoothing 0.1 \ 
# --sync-bn \
# --adam %