# yolov5-recycle-detection
*Recycle Trash Detection* for the follow-up study of 2020AGC.  

**[2020AGC(AI Grand Challenge)](http://www.ai-challenge.kr) (Nov 16, 2020  ~ Nov 20,2020)**  
**🥈 2nd Place Winner** of Object Classification Track  
<img src =https://user-images.githubusercontent.com/52495256/102849932-8e987180-445b-11eb-8728-96b52d696c5f.png width="40%"/>  

source : [ultralytics/yolov5](https://github.com/ultralytics/yolov5)



## TODO 
- [x] add `albumentation` for cropped objects  
- [x] comparison batch-size, freeze, crop-aug-plus
- [x] comparison rect, multi-scale, adam, sync-bn

---

## Dataset
The images are in each folders to distinguish between datasets.
```sh
$ cd ./data/images
$ ls 
train01 train02 ... valid01 valid02 ... test01 test02 ...
```
You can write `yaml` file like this. 

```yaml
# in dataset.yaml
base: './data/images'

train: ['train01', 'train02', ... ]
val: ['valid01', 'valid02', ... ]
test: ['test01', 'test02', ... ]
```
`train.py` is modified for the changed folder structure. 
```python
# in train.py
base_path = data_dict['base']
train_path = [ base_path+x for x in data_dict['train']]
test_path = [ base_path+x for x in data_dict['val']]
```


## Crop-Augmentation
```python
if self.train :
    img , labels = self.selfmix(img, labels, h, w)

...

def selfmix(self, img, labels, h, w):
    # add imgs of cropped objects
        # get cropped objects from the specific dataset.
        # random size offset 
        # add when a space is available
    # add labels of cropped objects 
    return img, labels
```  
### result
crop_aug_before          |  crop_aug_after
:-------------------------:|:-------------------------:
<img src="./asset/crop_aug_before.jpg"/>  |  <img src="./asset/crop_aug_after.jpg"/>