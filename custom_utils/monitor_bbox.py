from utils.datasets import create_dataloader
from utils.general import colorstr
import yaml
import os


with open('data/recycle_test.yaml') as f:
    data_dict = yaml.safe_load(f)  # data dict
base_path = data_dict['path']
train_path = [ base_path+x for x in data_dict['train']]

with open('data/hyps/hyp.scratch-p6.yaml') as f:
    hyp = yaml.safe_load(f)  # load hyps dict
    if 'anchors' not in hyp:  # anchors commented in hyp.yaml
        hyp['anchors'] = 3

imgsz = 1280
batch_size = 16
WORLD_SIZE = int(os.getenv('WORLD_SIZE', 1))
gs = max(64, 32) 
single_cls = False
rect = False
RANK = int(os.getenv('RANK', -1))
image_weights = False
quad = False 

workers = 8
cache_images = True
crop_aug = True


dataloader, dataset = create_dataloader(train_path, imgsz, batch_size // WORLD_SIZE, gs, single_cls,
                                            hyp=hyp, augment=True, cache=cache_images, rect=rect, rank=RANK,
                                            workers=workers,
                                            image_weights=image_weights, quad=quad, prefix=colorstr('train: '),
                                            crop_aug=crop_aug)