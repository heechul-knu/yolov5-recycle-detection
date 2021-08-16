import json
from pathlib import Path
import os
import numpy as np
import cv2
from tqdm import tqdm


LABELS = {
    'paper': 0,
    'paperpack': 1,
    'can': 2,
    'glass': 3,
    'pet': 4,
    'plastic': 5,
    'vinyl': 6,
}


def copy_img(base_path, target_path, dir_list):
    print(f">> copy_img! ")
    target_dir_list = os.listdir(f"{target_path}/images")
    for dirname in dir_list:
        print(f"[{dirname}] 작업 시작")
        if dirname in target_dir_list:
            print(f"- 이미 복사됨!")
            continue
        
        # img 복사
        img_target_path = f"{target_path}/images"
        if not Path(f"{img_target_path}/{dirname}").exists():
            os.mkdir(f"{img_target_path}/{dirname}")
            os.system(f"cp {base_path}/{dirname}/*.jpg {img_target_path}/{dirname}")
        print(f"- image 복사 완료!")

def convert_yolo_txt(base_path, target_path, dir_list):
    print(f">> convert_yolo_txt! ")
    target_dir_list = os.listdir(f"{target_path}/labels")
    for dirname in dir_list:
        print(f"[{dirname}] 작업 시작")
        if dirname in target_dir_list:
            print(f"- 이미 복사됨!")
            continue

        # labels 복사
        json_target_path = f"{target_path}/labels"
        if not Path(f"{json_target_path}/{dirname}").exists():
            os.mkdir(f"{json_target_path}/{dirname}")

        dict_label = {} # for label check

        json_list = list(Path(f"{base_path}/{dirname}").rglob("*.json"))
        # json 읽기
        for jsonfile in json_list:
            with open(jsonfile) as f:
                try:
                    data = json.load(f)
                except:
                    print(jsonfile)
                    continue

            w = data['imageWidth']
            h = data['imageHeight']

            # txt 생성
            with open(f"{json_target_path}/{dirname}/{jsonfile.name[:-4]}txt", 'w') as f:
                for bbox in data['shapes']:
                    label = bbox['label']
                    l_class = LABELS[bbox['label']]

                    points = np.array(bbox['points'])
                    min_p = (np.min(points[:,0]), np.min(points[:,1]))
                    max_p = (np.max(points[:,0]), np.max(points[:,1]))
                    width = max_p[0]-min_p[0]
                    height = max_p[1]-min_p[1]
                    l_bbox = [(max_p[0]+min_p[0])/2/w, (max_p[1]+min_p[1])/2/h, width/w, height/h]

                    # bbox 복사
                    f.write(f"{l_class} {l_bbox[0]} {l_bbox[1]} {l_bbox[2]} {l_bbox[3]}\n")

                    # label check
                    if label not in dict_label.keys():
                        dict_label[label] = 1
                    else:
                        dict_label[label] += 1

        print(f"- label 출력 : {dict_label.keys()}")
        print(f"- label 복사 완료!")

def check_num(target_path, dir_list): # 개수 check
    print(f">> check_num! ")
    for dirname in dir_list:
        img_list = list(Path(f"{target_path}/images/{dirname}").rglob("*.jpg"))
        txt_list = list(Path(f"{target_path}/labels/{dirname}").rglob("*.txt"))

        if len(img_list) == len(txt_list):
            print(f"[{dirname}] - OK!")
        else :
            print(f"[{dirname}] - Fail! ( img: {len(img_list)}, txt: {len(txt_list)} )")

def check_img(target_path, dir_list):
    print(f">> check_img! ")
    for dirname in dir_list:
        print(f"[{dirname}] 시작!")
        img_list = list(Path(f"{target_path}/images/{dirname}").rglob("*.jpg"))

        for imgfile in tqdm(img_list):
            try:
                img = cv2.imread(str(imgfile))
            except Exception as e:
                print(f"error -> {imgfile}")
        print(f"- 끝!")

def add_dataset(base_path, target_path):
    new_dir_list = os.listdir(base_path)
    copy_img(base_path, target_path, new_dir_list)
    convert_yolo_txt(base_path, target_path, new_dir_list)
    check_num(target_path, new_dir_list)
    check_img(target_path, new_dir_list)

    print(f">> add_dataset END! ")


if __name__ == "__main__":
    base_path = '../../../ssd_2/RecycleTrash/org'
    target_path = '../../../ssd_2/RecycleTrash/yolo'
    
    add_dataset(base_path, target_path)