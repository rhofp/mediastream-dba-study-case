import pandas as pd
import plotly.express as px

df = pd.read_csv('bda-t04-ep03-graficas-t05.csv')
df.head()

XAXIS = 'SAMPLE_DATE'
Y1AXIS = 'PGA_TOTAL_ACTUAL_MB'
Y2AXIS = 'PGA_IN_USE_ACTUAL_MB'
Y3AXIS = 'PGA_PROCESS_COUNT'

fig1 = px.line(df, x=XAXIS, y=Y1AXIS,title=XAXIS+' vs '+Y1AXIS)
fig1.show()

fig2 = px.line(df, x=XAXIS, y=Y2AXIS,title=XAXIS+' vs '+Y2AXIS)
fig2.show()

fig3 = px.line(df, x=XAXIS, y=Y3AXIS,title=XAXIS+' vs '+Y3AXIS)
fig3.show()
